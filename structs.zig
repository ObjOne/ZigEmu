pub const Architecture = enum {
    amd64,
};

pub const Chipset = enum {
    i440fx,
    q35,
};

pub const UsbType = enum {
    none,
    ohci,
    uhci,
    ehci,
    xhci,
};

pub const FirmwareType = enum {
    bios,
    uefi,
    custom_pc,
    custom_pflash,
};

pub const Cpu = enum {
    i486_v1,
    i486,
    athlon_v1,
    athlon,
    base,
    Broadwell_IBRS,
    Broadwell_noTSX_IBRS,
    Broadwell_noTSX,
    Broadwell_v1,
    Broadwell_v2,
    Broadwell_v3,
    Broadwell_v4,
    Broadwell,
    Cascadelake_Server_noTSX,
    Cascadelake_Server_v1,
    Cascadelake_Server_v2,
    Cascadelake_Server_v3,
    Cascadelake_Server_v4,
    Cascadelake_Server_v5,
    Cascadelake_Server,
    Conroe_v1,
    Conroe,
    Cooperlake_v1,
    Cooperlake_v2,
    Cooperlake,
    core2duo_v1,
    core2duo,
    coreduo_v1,
    coreduo,
    Denverton_v1,
    Denverton_v2,
    Denverton_v3,
    Denverton,
    Dhyana_v1,
    Dhyana_v2,
    Dhyana,
    EPYC_IBPB,
    EPYC_Milan_v1,
    EPYC_Milan,
    EPYC_Rome_v1,
    EPYC_Rome_v2,
    EPYC_Rome,
    EPYC_v1,
    EPYC_v2,
    EPYC_v3,
    EPYC,
    Haswell_IBRS,
    Haswell_noTSX_IBRS,
    Haswell_noTSX,
    Haswell_v1,
    Haswell_v2,
    Haswell_v3,
    Haswell_v4,
    Haswell,
    host,
    Icelake_Server_noTSX,
    Icelake_Server_v1,
    Icelake_Server_v2,
    Icelake_Server_v3,
    Icelake_Server_v4,
    Icelake_Server_v5,
    Icelake_Server_v6,
    Icelake_Server,
    IvyBridge_IBRS,
    IvyBridge_v1,
    IvyBridge_v2,
    IvyBridge,
    KnightsMill_v1,
    KnightsMill,
    kvm32_v1,
    kvm32,
    kvm64_v1,
    kvm64,
    max,
    n270_v1,
    n270,
    Nehalem_IBRS,
    Nehalem_v1,
    Nehalem_v2,
    Nehalem,
    Opteron_G1_v1,
    Opteron_G1,
    Opteron_G2_v1,
    Opteron_G2,
    Opteron_G3_v1,
    Opteron_G3,
    Opteron_G4_v1,
    Opteron_G4,
    Opteron_G5_v1,
    Opteron_G5,
    Penryn_v1,
    Penryn,
    pentium_v1,
    pentium,
    pentium2_v1,
    pentium2,
    pentium3_v1,
    pentium3,
    phenom_v1,
    phenom,
    qemu32_v1,
    qemu32,
    qemu64_v1,
    qemu64,
    SandyBridge_IBRS,
    SandyBridge_v1,
    SandyBridge_v2,
    SandyBridge,
    Skylake_Client_IBRS,
    Skylake_Client_noTSX_IBRS,
    Skylake_Client_v1,
    Skylake_Client_v2,
    Skylake_Client_v3,
    Skylake_Client_v4,
    Skylake_Client,
    Skylake_Server_IBRS,
    Skylake_Server_noTSX_IBRS,
    Skylake_Server_v1,
    Skylake_Server_v2,
    Skylake_Server_v3,
    Skylake_Server_v4,
    Skylake_Server_v5,
    Skylake_Server,
    Snowridge_v1,
    Snowridge_v2,
    Snowridge_v3,
    Snowridge_v4,
    Snowridge,
    Westmere_IBRS,
    Westmere_v1,
    Westmere_v2,
    Westmere,
};

pub const NetworkType = enum {
    none,
    nat,
};

pub const Interface = enum {
    rtl8139,
    e1000,
    e1000e,
    vmware,
    usb,
    virtio,
};

pub const Display = enum {
    none,
    sdl,
    gtk,
    spice,
    cocoa,
    dbus,
};

pub const Gpu = enum {
    none,
    vga,
    qxl,
    vmware,
    virtio,
};

pub const HostDevice = enum {
    none,
    sdl,
    alsa,
    oss,
    pulseaudio,
    sndio,
    coreaudio,
    directsound,
    wav,
};

pub const Sound = enum {
    sb16,
    ac97,
    ich6,
    ich9,
    usb,
};

pub const Keyboard = enum {
    none,
    usb,
    virtio,
};

pub const Mouse = enum {
    none,
    usb,
    virtio,
};

pub const DriveBus = enum {
    usb,
    ide,
    sata,
    virtio,
};

pub const DriveFormat = enum {
    raw,
    qcow2,
    vmdk,
    vdi,
    vhd,
};

pub const DriveCache = enum {
    none,
    writeback,
    writethrough,
    directsync,
    unsafe,
};

pub const Drive = struct {
    is_cdrom: bool,
    bus: DriveBus,
    format: DriveFormat,
    cache: DriveCache,
    is_ssd: bool,
    path: []const u8,
};

pub const VirtualMachine = struct {
    qemu: struct {
        override_qemu_path: bool,
        qemu_path: []const u8,
    },
    basic: struct {
        name: []const u8,
        architecture: Architecture,
        has_acceleration: bool,
        chipset: Chipset,
        usb_type: UsbType,
        has_ahci: bool,
    },
    firmware: struct {
        type: FirmwareType,
        firmware_path: []const u8,
    },
    memory: struct {
        ram: u64,
    },
    processor: struct {
        cpu: Cpu,
        features: []const u8,
        cores: u64,
        threads: u64,
    },
    network: struct {
        type: NetworkType,
        interface: Interface,
    },
    graphics: struct {
        display: Display,
        gpu: Gpu,
        has_vga_emulation: bool,
        has_graphics_acceleration: bool,
    },
    audio: struct {
        host_device: HostDevice,
        sound: Sound,
        has_input: bool,
        has_output: bool,
    },
    peripherals: struct {
        keyboard: Keyboard,
        mouse: Mouse,
        has_mouse_absolute_pointing: bool,
    },
    // TODO: This is horrible, we need to find a way to have an infinite number of drives
    drive0: Drive,
    drive1: Drive,
    drive2: Drive,
    drive3: Drive,
    drive4: Drive,
};
