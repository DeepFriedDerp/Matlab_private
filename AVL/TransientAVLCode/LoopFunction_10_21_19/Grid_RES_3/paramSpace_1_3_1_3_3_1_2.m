function [aeroForces] = paramSpace_1_3_1_3_3_1_2(sailStates,airStates)

	CL = (4.274808)*sailStates.alpha + (0.338876)*sailStates.beta + (-2.516600)*sailStates.p + (37.206978)*sailStates.q + (-1.671649)*sailStates.r + (0.010909)*sailStates.de;
	CD = -0.246270;
	CY = (0.065602)*sailStates.alpha + (-0.023471)*sailStates.beta + (-0.599030)*sailStates.p + (0.491626)*sailStates.q + (-0.105672)*sailStates.r + (0.000104)*sailStates.de;

	Cl = (1.356401)*sailStates.alpha + (0.373158)*sailStates.beta + (-1.130060)*sailStates.p + (9.863620)*sailStates.q + (-1.340447)*sailStates.r + (0.000188)*sailStates.de;
	Cm = (-12.877657)*sailStates.alpha + (-1.318992)*sailStates.beta + (7.713928)*sailStates.p + (-133.990982)*sailStates.q + (5.604243)*sailStates.r + (-0.067390)*sailStates.de;
	Cn = (-0.123010)*sailStates.alpha + (0.046739)*sailStates.beta + (1.163059)*sailStates.p + (-4.932917)*sailStates.q + (0.003689)*sailStates.r + (-0.000218)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end