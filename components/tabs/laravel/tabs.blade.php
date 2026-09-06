@props([
    'id',
    'tabs',
    'selectedIndex' => 0,
    'label' => 'Seções',
])

@php
    $normalizedId = trim((string) $id);
    $normalizedLabel = trim((string) $label);
    $normalizedTabs = collect($tabs)->values()->map(function ($tab) {
        if (!is_array($tab) || !array_key_exists('label', $tab) || !array_key_exists('content', $tab)) {
            throw new InvalidArgumentException('Cada aba deve conter label e content.');
        }

        $tab['label'] = trim((string) $tab['label']);
        if ($tab['label'] === '') {
            throw new InvalidArgumentException('Rótulos de abas não podem ser vazios.');
        }

        return $tab;
    });

    if ($normalizedId === '') {
        throw new InvalidArgumentException('id não pode ser vazio.');
    }
    if ($normalizedLabel === '') {
        throw new InvalidArgumentException('label não pode ser vazio.');
    }
    if ($normalizedTabs->isEmpty()) {
        throw new InvalidArgumentException('tabs não pode ser vazio.');
    }
    if (!is_int($selectedIndex) || !$normalizedTabs->has($selectedIndex)) {
        throw new InvalidArgumentException('selectedIndex fora do intervalo válido.');
    }
@endphp

<div class="ciata-tabs" data-ciata-tabs>
    <div class="ciata-tabs__list" role="tablist" aria-label="{{ $normalizedLabel }}">
        @foreach($normalizedTabs as $index => $tab)
            <button
                type="button"
                id="{{ $normalizedId }}-tab-{{ $index }}"
                class="ciata-tabs__tab"
                role="tab"
                aria-selected="{{ $index === $selectedIndex ? 'true' : 'false' }}"
                aria-controls="{{ $normalizedId }}-panel-{{ $index }}"
                tabindex="{{ $index === $selectedIndex ? '0' : '-1' }}"
            >{{ $tab['label'] }}</button>
        @endforeach
    </div>

    @foreach($normalizedTabs as $index => $tab)
        <div
            id="{{ $normalizedId }}-panel-{{ $index }}"
            class="ciata-tabs__panel"
            role="tabpanel"
            aria-labelledby="{{ $normalizedId }}-tab-{{ $index }}"
            @if($index !== $selectedIndex) hidden @endif
        >{{ $tab['content'] }}</div>
    @endforeach
</div>
