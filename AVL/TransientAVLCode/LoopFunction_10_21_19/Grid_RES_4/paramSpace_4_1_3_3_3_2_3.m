function [aeroForces] = paramSpace_4_1_3_3_3_2_3(sailStates,airStates)

	CL = (3.707653)*sailStates.alpha + (0.210989)*sailStates.beta + (-2.726012)*sailStates.p + (37.094055)*sailStates.q + (0.958846)*sailStates.r + (0.010558)*sailStates.de;
	CD = 0.089160;
	CY = (0.057121)*sailStates.alpha + (-0.023817)*sailStates.beta + (0.180360)*sailStates.p + (0.294837)*sailStates.q + (-0.035865)*sailStates.r + (0.000062)*sailStates.de;

	Cl = (1.291264)*sailStates.alpha + (-0.033977)*sailStates.beta + (-1.415996)*sailStates.p + (12.382641)*sailStates.q + (0.673061)*sailStates.r + (0.000819)*sailStates.de;
	Cm = (-13.243615)*sailStates.alpha + (-0.790571)*sailStates.beta + (9.081425)*sailStates.p + (-141.543869)*sailStates.q + (-3.245022)*sailStates.r + (-0.067447)*sailStates.de;
	Cn = (-0.299424)*sailStates.alpha + (0.013955)*sailStates.beta + (-0.167118)*sailStates.p + (-0.499948)*sailStates.q + (-0.044657)*sailStates.r + (-0.000070)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end