ENTRY(start)
SECTIONS
{
  . = 1M;
  .boot :
  {
    KEEP(*(.mulbootheader))
  }
  .text :
  {
    *(.text)
  }
}
