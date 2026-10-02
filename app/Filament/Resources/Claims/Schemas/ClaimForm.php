<?php

namespace App\Filament\Resources\Claims\Schemas;

use App\Models\Member;
use Filament\Forms\Components\DatePicker;
use Filament\Forms\Components\FileUpload;
use Filament\Forms\Components\Hidden;
use Filament\Forms\Components\Repeater;
use Filament\Schemas\Components\Section;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Textarea;
use Filament\Schemas\Schema;
use Livewire\Features\SupportFileUploads\TemporaryUploadedFile;

class ClaimForm
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->components([
                Section::make(__('Claim Details'))
                    ->schema([
                        Select::make('member_id')
                            ->label(__('Member ID'))
                            ->options(fn () => Member::where('is_active', true)->pluck('member_ID', 'id'))
                            ->searchable()
                            ->required()
                            ->disabled(fn ($record) => $record && $record->statement_id !== null),

                        DatePicker::make('service_date')
                            ->label(__('Service Date'))
                            ->default(now())
                            ->required()
                            ->disabled(fn ($record) => $record && $record->statement_id !== null)
                            ,

                        Repeater::make('attachments')
                            ->relationship('attachments')
                            ->schema([
                                FileUpload::make('file_path')
                                    ->label(__('Document File'))
                                    ->directory('claim-documents')
                                    ->acceptedFileTypes(['application/pdf', 'image/jpeg', 'image/png'])
                                    ->maxSize(5120)
                                    ->required()
                                    ->openable()
                                    ->downloadable()
                                    ->live()
                                    // ✅ FIX: Removed strict type-hint ($state) to accept string or uploaded file
                                    ->afterStateUpdated(function ($state, callable $set) {
                                        if (! $state) return;

                                        // If it's a newly uploaded temporary file
                                        if ($state instanceof TemporaryUploadedFile) {
                                            $ext = strtolower($state->getClientOriginalExtension());
                                            $size = $state->getSize();
                                        } 
                                        // If it's an existing string path or array
                                        else if (is_string($state)) {
                                            $ext = strtolower(pathinfo($state, PATHINFO_EXTENSION));
                                            $size = 0;
                                        } else {
                                            return;
                                        }

                                        $type = in_array($ext, ['jpg', 'jpeg', 'png']) ? $ext : 'pdf';

                                        $set('file_type', $type === 'jpeg' ? 'jpg' : $type);
                                        if ($size > 0) {
                                            $set('file_size', $size);
                                        }
                                    }),
                                Hidden::make('file_type')->default('pdf'),
                                Hidden::make('file_size')->default(0),
                                
                            ])
                            
                            ->columns(1)
                            ->minItems(1)
                            ->addActionLabel(__('Add Attachment'))
                            ->columnSpanFull()
                            ->disabled(fn ($record) => $record && $record->statement_id !== null)
                            ,
                            TextInput::make('claimed_amount')
                            ->label(__('Claimed Amount'))
                            ->numeric()
                            ->prefix('LYD')
                            ->required()
                            ->columnSpanFull()
                            // ->columns(1)

                            ->disabled(fn ($record) => $record && $record->statement_id !== null)
                            
                    ])->columns(2),

                Section::make(__('Reviewer Options'))
                    ->visible(function () {
                        $user = auth()->user();

                        return $user && ($user->isDoctor());
                    })
                    ->schema([
                        Select::make('status')
                            ->label(__('Status'))
                            ->options([
                                // 'pend' => 'Pending',
                                'appr' => 'Approved',
                                'part' => 'Partially Approved',
                                'rej'  => 'Rejected',
                            ])
                            ->required(),

                        TextInput::make('approved_amount')
                            ->label(__('Approved Amount'))
                            ->numeric()
                            ->prefix('LYD')
                            ->required(fn (callable $get) => in_array($get('status'), ['appr', 'part'])),

                        Textarea::make('reviewer_notes')
                            ->label(__('Reviewer Notes'))
                            ->maxLength(255)
                            ->columnSpanFull(),
                    ])->columns(2),
            ]);
    }
}