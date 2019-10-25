function [aeroForces] = paramSpace_1_4_2_3_1_2_3(sailStates,airStates)

	CL = (3.707652)*sailStates.alpha + (0.210990)*sailStates.beta + (-2.726012)*sailStates.p + (37.094048)*sailStates.q + (-0.958846)*sailStates.r + (0.010558)*sailStates.de;
	CD = 0.089160;
	CY = (-0.057121)*sailStates.alpha + (-0.025755)*sailStates.beta + (-0.180360)*sailStates.p + (-0.294837)*sailStates.q + (-0.035865)*sailStates.r + (-0.000062)*sailStates.de;

	Cl = (1.163547)*sailStates.alpha + (0.164160)*sailStates.beta + (-1.321623)*sailStates.p + (11.194763)*sailStates.q + (-0.654247)*sailStates.r + (0.000563)*sailStates.de;
	Cm = (-13.243615)*sailStates.alpha + (-0.790571)*sailStates.beta + (9.081425)*sailStates.p + (-141.543854)*sailStates.q + (3.245022)*sailStates.r + (-0.067447)*sailStates.de;
	Cn = (0.246368)*sailStates.alpha + (0.025457)*sailStates.beta + (0.185890)*sailStates.p + (0.263665)*sailStates.q + (-0.040914)*sailStates.r + (0.000070)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end