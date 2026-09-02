@props([
    'href',
    'external' => false,
    'newWindow' => false,
    'download' => false,
    'downloadMeta' => null,
])

@php
    $opensNewContext = $external || $newWindow;
@endphp

<a
    href="{{ $href }}"
    class="ciata-link {{ $attributes->get('class') }}"
    @if($newWindow) target="_blank" rel="noopener noreferrer" @endif
    @if($external && !$newWindow) rel="external" @endif
    @if($download) download @endif
    {{ $attributes->except(['class']) }}
>
    {{ $slot }}
    @if($downloadMeta)
        <span class="ciata-link__context">, {{ $downloadMeta }}</span>
    @endif
    @if($opensNewContext)
        <span class="ciata-link__context"> (abre em novo contexto)</span>
    @endif
</a>
