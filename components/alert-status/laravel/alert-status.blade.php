@props([
    'title' => null,
    'variant' => 'info',
    'priority' => 'status',
])

@php
    $role = $priority === 'alert' ? 'alert' : 'status';
    $live = $priority === 'alert' ? 'assertive' : 'polite';
@endphp

<div
    class="ciata-alert-status"
    data-variant="{{ $variant }}"
    role="{{ $role }}"
    aria-live="{{ $live }}"
    aria-atomic="true"
    {{ $attributes }}
>
    @if($title)
        <div class="ciata-alert-status__title">{{ $title }}</div>
    @endif

    <p class="ciata-alert-status__message">{{ $slot }}</p>
</div>
