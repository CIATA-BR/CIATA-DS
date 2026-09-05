@props([
    'title' => null,
    'variant' => 'info',
    'priority' => 'status',
])

@php
    $title = $title === null ? null : trim((string) $title);
    $variant = trim((string) $variant);
    $priority = trim((string) $priority);

    if (! in_array($variant, ['info', 'success', 'warning', 'error'], true)) {
        throw new InvalidArgumentException('variant deve ser info, success, warning ou error.');
    }
    if (! in_array($priority, ['status', 'alert'], true)) {
        throw new InvalidArgumentException('priority deve ser status ou alert.');
    }

    $role = $priority;
@endphp

<div
    class="ciata-alert-status"
    data-variant="{{ $variant }}"
    role="{{ $role }}"
    aria-atomic="true"
    {{ $attributes }}
>
    @if($title !== null && $title !== '')
        <div class="ciata-alert-status__title">{{ $title }}</div>
    @endif

    <p class="ciata-alert-status__message">{{ $slot }}</p>
</div>
