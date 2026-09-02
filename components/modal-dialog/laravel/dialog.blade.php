@props([
    'id',
    'title',
    'description' => null,
])

<dialog
    id="{{ $id }}"
    class="ciata-dialog"
    aria-labelledby="{{ $id }}-title"
    @if($description) aria-describedby="{{ $id }}-description" @endif
    {{ $attributes }}
>
    <h2 id="{{ $id }}-title" class="ciata-dialog__title">{{ $title }}</h2>

    @if($description)
        <p id="{{ $id }}-description">{{ $description }}</p>
    @endif

    <div class="ciata-dialog__content">
        {{ $slot }}
    </div>

    @isset($actions)
        <div class="ciata-dialog__actions">{{ $actions }}</div>
    @endisset
</dialog>
