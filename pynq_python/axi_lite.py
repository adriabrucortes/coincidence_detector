class axilite():
    
    def __init__(self, ip):
        self._ip = ip
        self._regs = self._ip.register_map   
        
        
    def __getattr__(self, attr):
        return int(getattr(self._regs, attr))

    
    def __setattr__(self, attr, value):
        if attr.startswith('_'):
            super().__setattr__(attr, value)
        else:
            setattr(self._regs, attr, value)
    
    @property
    def regs(self):
        regs_list = [
            int(value) for attr, value in self._regs._instances.items()
        ]
        return regs_list
    
    
    def print_regs(self):
        formatted_list = [
            f"{attr}: {int(value)}" 
            for attr, value in self._regs._instances.items()
        ]
        print("\n".join(formatted_list))
        
    @property
    def __doc__(self):
        
        docstring = "AXI Lite Overlay for PYNQ modules. \n\nAttributes: \n-----------------------------------------------------------"
        docstring += "\n [Register] "
        
        attrs = [
            attr for attr, value in self._regs._instances.items()
        ]
        docstring += "\n [Register] ".join(attrs)

        parent_attrs = set(dir(self.__class__.__bases__[0]))
        inherited_attrs = parent_attrs - {'__init__', '__getattr__', '__setattr__', 'regs', 'print_regs'}
        for attr in inherited_attrs:
            if not attr.startswith('_'):
                if callable(getattr(self.__class__.__bases__[0], attr)):
                    docstring += f"\n [Function] {attr}"
                else:
                    docstring += f"\n [Value   ] {attr}"
        # Add own attributes
        own_attrs = set(dir(self)) - parent_attrs
        for attr in own_attrs:
            if not attr.startswith('_'):
                if callable(getattr(self, attr)):
                    docstring += f"\n [Function] {attr}"
                else:
                    docstring += f"\n [Value   ] {attr}"

        return docstring