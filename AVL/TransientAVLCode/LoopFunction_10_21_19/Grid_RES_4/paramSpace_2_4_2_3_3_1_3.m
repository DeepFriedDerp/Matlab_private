function [aeroForces] = paramSpace_2_4_2_3_3_1_3(sailStates,airStates)

	CL = (4.314224)*sailStates.alpha + (0.254814)*sailStates.beta + (-2.819239)*sailStates.p + (37.627926)*sailStates.q + (-1.152320)*sailStates.r + (0.011142)*sailStates.de;
	CD = -0.249870;
	CY = (0.019482)*sailStates.alpha + (-0.024125)*sailStates.beta + (-0.481921)*sailStates.p + (0.563442)*sailStates.q + (-0.031607)*sailStates.r + (0.000121)*sailStates.de;

	Cl = (1.426469)*sailStates.alpha + (0.291790)*sailStates.beta + (-1.364783)*sailStates.p + (11.295772)*sailStates.q + (-0.980430)*sailStates.r + (0.000540)*sailStates.de;
	Cm = (-14.179010)*sailStates.alpha + (-0.993575)*sailStates.beta + (9.354852)*sailStates.p + (-143.062881)*sailStates.q + (3.908602)*sailStates.r + (-0.069716)*sailStates.de;
	Cn = (0.018201)*sailStates.alpha + (0.012717)*sailStates.beta + (0.980670)*sailStates.p + (-4.557233)*sailStates.q + (0.005869)*sailStates.r + (-0.000240)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end