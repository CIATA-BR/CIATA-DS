@props([
    'title',
    'description' => null,
    'href' => null,
    'type' => 'info',
])

@php
    $title = trim((string) $title);
    $description = $description === null ? null : trim((string) $description);
    $type = trim((string) $type);
    $href = $href === null ? null : trim((string) $href);

    if ($title === '') {
        throw new InvalidArgumentException('title não pode ser vazio.');
    }
    if (! in_array($type, ['info', 'link', 'button'], true)) {
        throw new InvalidArgumentException('type deve ser info, link ou button.');
    }
    if ($type === 'link' && ($href === null || $href === '')) {
        throw new InvalidArgumentException('href é obrigatório quando type for link.');
    }

    $isLink = $type === 'link';
    $isButton = $type === 'button';
@endphp

@if($isLink)
    <a href="{{ $href }}" class="ciata-card ciata-card--link" {{ $attributes }}>
        <span class="ciata-card__title">{{ $title }}</span>
        @if($description !== null && $description !== '')<span class="ciata-card__description">{{ $description }}</span>@endif
    </a>
@elseif($isButton)
    <button type="button" class="ciata-card ciata-card--action" {{ $attributes }}>
        <span class="ciata-card__title">{{ $title }}</span>
        @if($description !== null && $description !== '')<span class="ciata-card__description">{{ $description }}</span>@endif
    </button>
@else
    <article class="ciata-card" {{ $attributes }}>
        <div class="ciata-card__title">{{ $title }}</div>
        @if($description !== null && $description !== '')<p class="ciata-card__description">{{ $description }}</p>@endif
        @isset($actions)<div class="ciata-card__actions">{{ $actions }}</div>@endisset
    </article>
@endif
