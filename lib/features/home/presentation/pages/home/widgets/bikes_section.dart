part of '../home_page.dart';

class _BikesSection extends StatefulWidget {
  const _BikesSection();

  @override
  State<_BikesSection> createState() => _BikesSectionState();
}

class _BikesSectionState extends State<_BikesSection> {
  Availability? _selectedFilter;

  @override
  Widget build(BuildContext context) {
    final textStyles = context.textStyles;
    final colors = context.colors;
    final t = context.t;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          t.electrumBikes,
          style: textStyles.h3.bold.applyColor(colors.onSurface),
        ),
        const SizedBox(height: 8),
        Text(
          t.electrumBikesDescription,
          style: textStyles.p.applyColor(colors.onSurfaceMuted),
        ),
        const SizedBox(height: 16),
        // Filter Chips
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _FilterChip(
                label: 'All',
                isSelected: _selectedFilter == null,
                onTap: () {
                  setState(() => _selectedFilter = null);
                },
              ),
              const SizedBox(width: 8),
              _FilterChip(
                label: t.available,
                isSelected: _selectedFilter == Availability.available,
                onTap: () {
                  setState(() => _selectedFilter = Availability.available);
                },
              ),
              const SizedBox(width: 8),
              _FilterChip(
                label: t.limited,
                isSelected: _selectedFilter == Availability.limited,
                onTap: () {
                  setState(() => _selectedFilter = Availability.limited);
                },
              ),
              const SizedBox(width: 8),
              _FilterChip(
                label: t.unavailable,
                isSelected: _selectedFilter == Availability.unavailable,
                onTap: () {
                  setState(() => _selectedFilter = Availability.unavailable);
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        BikeStatefulGrid(filter: _selectedFilter),
      ],
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _FilterChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? colors.primary : colors.surfaceVariant,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? colors.primary : colors.outline,
            width: 1,
          ),
        ),
        child: Text(
          label,
          style: textStyles.p.medium.applyColor(
            isSelected ? colors.onPrimary : colors.onSurface,
          ),
        ),
      ),
    );
  }
}
