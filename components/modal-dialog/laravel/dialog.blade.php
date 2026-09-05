@props([
    'id',
    'title',
    'description' => null,
])

@php
    $id = trim((string) $id);
    $title = trim((string) $title);
    $description = $description === null ? null : trim((string) $description);

    if ($id === '' || $title === '') {
        throw new InvalidArgumentException('id e title não podem ser vazios.');
    }
@endphp

<dialog
    id="{{ $id }}"
    class="ciata-dialog"
    aria-labelledby="{{ $id }}-title"
    @if($description !== null && $description !== '') aria-describedby="{{ $id }}-description" @endif
    {{ $attributes }}
>
    <h2 id="{{ $id }}-title" class="ciata-dialog__title">{{ $title }}</h2>

    @if($description !== null && $description !== '')
        <p id="{{ $id }}-description">{{ $description }}</p>
    @endif

    <div class="ciata-dialog__content">
        {{ $slot }}
    </div>

    @isset($actions)
        <div class="ciata-dialog__actions">{{ $actions }}</div>
    @endisset
</dialog>
