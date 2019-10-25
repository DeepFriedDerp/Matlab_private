function [aeroForces] = paramSpace_1_1_1_1_2_2_1(sailStates,airStates)

	CL = (3.534682)*sailStates.alpha + (-0.148904)*sailStates.beta + (-1.625456)*sailStates.p + (27.818802)*sailStates.q + (-0.578180)*sailStates.r + (0.010119)*sailStates.de;
	CD = 0.067310;
	CY = (-0.027220)*sailStates.alpha + (-0.023200)*sailStates.beta + (-0.121962)*sailStates.p + (-0.589408)*sailStates.q + (-0.021449)*sailStates.r + (-0.000123)*sailStates.de;

	Cl = (0.644317)*sailStates.alpha + (0.058417)*sailStates.beta + (-0.503781)*sailStates.p + (3.624478)*sailStates.q + (-0.387824)*sailStates.r + (-0.000668)*sailStates.de;
	Cm = (-12.625751)*sailStates.alpha + (0.614481)*sailStates.beta + (5.451365)*sailStates.p + (-110.634644)*sailStates.q + (1.979820)*sailStates.r + (-0.065270)*sailStates.de;
	Cn = (-0.107402)*sailStates.alpha + (0.013208)*sailStates.beta + (0.221920)*sailStates.p + (-0.371637)*sailStates.q + (-0.013876)*sailStates.r + (0.000164)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end