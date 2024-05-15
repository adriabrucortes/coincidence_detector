#!/usr/bin/env python
# coding: utf-8

# # Coincidence counts acquisition

# ### Libraries

# In[1]:


import pynq
from axi_lite import axilite
from pynq import Overlay, Clocks
import numpy as np


# ### Set CLK speed

# In[2]:


Clocks.fclk0_mhz = 1500
Clocks.fclk1_mhz = 1500
Clocks.fclk2_mhz = 1500
Clocks.fclk3_mhz = 1500

print(f'CPU:   {Clocks.cpu_mhz:.6f}MHz')
print(f'FCLK0: {Clocks.fclk0_mhz:.6f}MHz')
print(f'FCLK1: {Clocks.fclk1_mhz:.6f}MHz')
print(f'FCLK2: {Clocks.fclk2_mhz:.6f}MHz')
print(f'FCLK3: {Clocks.fclk3_mhz:.6f}MHz')


# ### Program logic

# In[3]:


ol = Overlay("coincidence.bit")
det = axilite(ol.axilite_detector_0)


# In[4]:


get_ipython().run_line_magic('pinfo', 'det')


# In[7]:


det.nCycles = 105010
det.Enable = 1
det.Restart = 0
det.Enable = 0

det.print_regs()


# In[11]:


det.Restart = 1
det.Enable = 0
det.Delay_A = 150
det.Delay_B = 13
det.Delay_C = 28
det.Delay_D = 1000
det.nCycles = 4294967295
det.regs


# In[ ]:




