function [aeroForces] = paramSpace_14_1_4_2_1_2_1(sailStates,airStates)

	CL = (4.126436)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.294392)*sailStates.p + (35.792694)*sailStates.q + (1.622355)*sailStates.r + (0.010756)*sailStates.de;
	CD = -0.141600;
	CY = (-0.081168)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.542553)*sailStates.p + (-0.230434)*sailStates.q + (-0.115348)*sailStates.r + (-0.000049)*sailStates.de;

	Cl = (1.257724)*sailStates.alpha + (-0.262149)*sailStates.beta + (-0.994427)*sailStates.p + (8.868709)*sailStates.q + (1.273371)*sailStates.r + (0.000032)*sailStates.de;
	Cm = (-12.465164)*sailStates.alpha + (-0.000000)*sailStates.beta + (6.890931)*sailStates.p + (-128.239044)*sailStates.q + (-5.414960)*sailStates.r + (-0.066831)*sailStates.de;
	Cn = (0.223760)*sailStates.alpha + (0.055722)*sailStates.beta + (-1.043272)*sailStates.p + (4.148278)*sailStates.q + (-0.004236)*sailStates.r + (0.000129)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end