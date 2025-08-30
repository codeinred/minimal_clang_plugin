#pragma once

#define COLOR_RE "\033[0m"
#define COLOR_Bl "\033[30m"
#define COLOR_R "\033[31m"
#define COLOR_G "\033[32m"
#define COLOR_Y "\033[33m"
#define COLOR_B "\033[34m"
#define COLOR_M "\033[35m"
#define COLOR_C "\033[36m"
#define COLOR_W "\033[37m"
#define COLOR_BBl "\033[90;1m"
#define COLOR_BR "\033[91;1m"
#define COLOR_BG "\033[92;1m"
#define COLOR_BY "\033[93;1m"
#define COLOR_BB "\033[94;1m"
#define COLOR_BM "\033[95;1m"
#define COLOR_BC "\033[96;1m"
#define COLOR_BW "\033[97;1m"

// specify gray as an RGB color
// #define COLOR_GRAY "\033[32;2;131;148;150m"
#define COLOR_GRAY "\033[38;2;130;130;120m"

namespace mp::colors {
// Reset
constexpr char RE[] = "\033[0m";

// Foreground colors
constexpr char Bl[] = "\033[30m"; ///< Fg: Black
constexpr char R[]  = "\033[31m"; ///< Fg: Red
constexpr char G[]  = "\033[32m"; ///< Fg: Green
constexpr char Y[]  = "\033[33m"; ///< Fg: Yellow
constexpr char B[]  = "\033[34m"; ///< Fg: Blue
constexpr char M[]  = "\033[35m"; ///< Fg: Magenta
constexpr char C[]  = "\033[36m"; ///< Fg: Cyan
constexpr char W[]  = "\033[37m"; ///< Fg: White

// Bright foreground colors (prefer these for anything eye-catching)
constexpr char BBl[] = "\033[90;1m"; ///< Fg: Bright Bold Black
constexpr char BR[]  = "\033[91;1m"; ///< Fg: Bright Bold Red
constexpr char BG[]  = "\033[92;1m"; ///< Fg: Bright Bold Green
constexpr char BY[]  = "\033[93;1m"; ///< Fg: Bright Bold Yellow
constexpr char BB[]  = "\033[94;1m"; ///< Fg: Bright Bold Blue
constexpr char BM[]  = "\033[95;1m"; ///< Fg: Bright Bold Magenta
constexpr char BC[]  = "\033[96;1m"; ///< Fg: Bright Bold Cyan
constexpr char BW[]  = "\033[97;1m"; ///< Fg: Bright Bold White
} // namespace mp::colors
