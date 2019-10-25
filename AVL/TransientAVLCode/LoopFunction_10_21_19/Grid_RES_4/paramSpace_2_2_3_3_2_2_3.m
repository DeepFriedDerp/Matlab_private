function [aeroForces] = paramSpace_2_2_3_3_2_2_3(sailStates,airStates)

	CL = (4.029935)*sailStates.alpha + (-0.021210)*sailStates.beta + (-2.827030)*sailStates.p + (37.069080)*sailStates.q + (-0.363101)*sailStates.r + (0.011185)*sailStates.de;
	CD = 0.029310;
	CY = (-0.000323)*sailStates.alpha + (-0.024997)*sailStates.beta + (-0.078648)*sailStates.p + (0.065300)*sailStates.q + (-0.005153)*sailStates.r + (0.000014)*sailStates.de;

	Cl = (1.371169)*sailStates.alpha + (0.028477)*sailStates.beta + (-1.437012)*sailStates.p + (11.960851)*sailStates.q + (-0.245554)*sailStates.r + (0.000733)*sailStates.de;
	Cm = (-14.595313)*sailStates.alpha + (0.066694)*sailStates.beta + (9.627116)*sailStates.p + (-144.341232)*sailStates.q + (1.218152)*sailStates.r + (-0.070808)*sailStates.de;
	Cn = (0.075892)*sailStates.alpha + (0.002267)*sailStates.beta + (0.097329)*sailStates.p + (-0.230637)*sailStates.q + (-0.003578)*sailStates.r + (-0.000035)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end