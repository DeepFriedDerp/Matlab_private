function [aeroForces] = paramSpace_1_1_1_3_1_1_3(sailStates,airStates)

	CL = (3.901325)*sailStates.alpha + (-0.385129)*sailStates.beta + (-2.775148)*sailStates.p + (39.471817)*sailStates.q + (-1.629012)*sailStates.r + (0.010931)*sailStates.de;
	CD = -0.114690;
	CY = (-0.094586)*sailStates.alpha + (-0.023756)*sailStates.beta + (-0.497846)*sailStates.p + (-0.294836)*sailStates.q + (-0.098996)*sailStates.r + (-0.000062)*sailStates.de;

	Cl = (1.309817)*sailStates.alpha + (0.147149)*sailStates.beta + (-1.431415)*sailStates.p + (12.999811)*sailStates.q + (-1.309901)*sailStates.r + (0.000819)*sailStates.de;
	Cm = (-12.085091)*sailStates.alpha + (1.509642)*sailStates.beta + (8.638818)*sailStates.p + (-141.543869)*sailStates.q + (5.470162)*sailStates.r + (-0.067447)*sailStates.de;
	Cn = (0.367723)*sailStates.alpha + (0.048010)*sailStates.beta + (0.878467)*sailStates.p + (-2.602777)*sailStates.q + (-0.029532)*sailStates.r + (0.000021)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end