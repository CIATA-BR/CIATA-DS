@props([
    'currentPage',
    'totalPages',
    'hrefForPage',
    'label' => 'Paginação',
    'window' => 2,
])

@php
    $window = max(0, (int) $window);
    $pages = collect([1, $totalPages])
        ->merge(range(max(1, $currentPage - $window), min($totalPages, $currentPage + $window)))
        ->filter(fn ($page) => $page >= 1 && $page <= $totalPages)
        ->unique()
        ->sort()
        ->values();
@endphp

<nav aria-label="{{ $label }}">
    <div class="ciata-pagination">
        @if($currentPage > 1)
            <a href="{{ $hrefForPage($currentPage - 1) }}" aria-label="Página anterior">Anterior</a>
        @endif

        @foreach($pages as $index => $page)
            @if($index > 0 && $page - $pages[$index - 1] > 1)
                <span aria-hidden="true">…</span>
            @endif
            <a
                href="{{ $hrefForPage($page) }}"
                aria-label="Página {{ $page }}"
                @if($page === $currentPage) aria-current="page" @endif
            >{{ $page }}</a>
        @endforeach

        @if($currentPage < $totalPages)
            <a href="{{ $hrefForPage($currentPage + 1) }}" aria-label="Próxima página">Próxima</a>
        @endif
    </div>
</nav>
