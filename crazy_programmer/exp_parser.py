import argparse
import sys



def main():
    parser = argparse.ArgumentParser(description='Real-time PAL/NTSC video decoder')

    # выбор источника данных: файл или stdin (вместе нельзя)
    input_group = parser.add_mutually_exclusive_group(required=True)
    input_group.add_argument('--input', '-i', help='Input file path')
    input_group.add_argument('--stdin', action='store_true', help='Read from stdin')

    # основные аргументы
    parser.add_argument('--sr', '-s', type=float, required=True, help='Sample rate, e.g. 10000000')
    parser.add_argument('--format', '-f', choices=['float32', 'int16', 'complex64'], default='float32', help='Input sample format')
    parser.add_argument('--debug', action='store_true', help='Enable debug logs')
    parser.add_argument('--output-mp4', type=str, help='Output MP4/AVI file path')
    parser.add_argument('--mp4-codec', type=str, default=None, help='FOURCC codec, e.g. mp4v, MJPG, XVID')
    parser.add_argument('--video-fps', type=float, default=None, help='Force FPS (otherwise auto by PAL/NTSC)')
    # backend записи видео фиксирован — OpenCV
    parser.add_argument('--live', action='store_true', help='Enable live preview (requires opencv-python, not headless)')
    parser.add_argument('--out-dir', type=str, default=None, help='Directory to save frames as images (fallback when no ffmpeg)')
    parser.add_argument('--img-format', type=str, default='png', help='Image format: png or jpg')
    parser.add_argument('--max-frames', type=int, default=None, help='Stop after this many frames')

    # если скрипт вызван без аргументов — уходим в интерактивный режим
    if len(sys.argv) == 1:
        return

    args = parser.parse_args()

    print(args.sr)
    print(args.input)



    # дальше run_from_file/stdin сами выведут стартовые сообщения

if __name__ == "__main__":
    main()