@props([
    'title',
    'description' => null,
    'href' => null,
    'type' => 'info',
])

@php
    $isLink = $type === 'link';
    $isButton = $type === 'button';
@endphp

@if($isLink)
    <a href="{{ $href }}" class="ciata-card ciata-card--link" {{ $attributes }}>
        <span class="ciata-card__title">{{ $title }}</span>
        @if($description)<span class="ciata-card__description">{{ $description }}</span>@endif
    </a>
@elseif($isButton)
    <button type="button" class="ciata-card ciata-card--action" {{ $attributes }}>
        <span class="ciata-card__title">{{ $title }}</span>
        @if($description)<span class="ciata-card__description">{{ $description }}</span>@endif
    </button>
@else
    <article class="ciata-card" {{ $attributes }}>
        <div class="ciata-card__title">{{ $title }}</div>
        @if($description)<p class="ciata-card__description">{{ $description }}</p>@endif
        @isset($actions)<div class="ciata-card__actions">{{ $actions }}</div>@endisset
    </article>
@endif
