function [aeroForces] = paramSpace_1_3_3_3_1_2_3(sailStates,airStates)

	CL = (3.834561)*sailStates.alpha + (0.132687)*sailStates.beta + (-2.752617)*sailStates.p + (37.004337)*sailStates.q + (-0.826170)*sailStates.r + (0.010839)*sailStates.de;
	CD = 0.062330;
	CY = (-0.053868)*sailStates.alpha + (-0.025554)*sailStates.beta + (-0.126761)*sailStates.p + (-0.318253)*sailStates.q + (-0.022382)*sailStates.r + (-0.000068)*sailStates.de;

	Cl = (1.199097)*sailStates.alpha + (0.123666)*sailStates.beta + (-1.340295)*sailStates.p + (11.244962)*sailStates.q + (-0.531285)*sailStates.r + (0.000580)*sailStates.de;
	Cm = (-13.869155)*sailStates.alpha + (-0.412015)*sailStates.beta + (9.245540)*sailStates.p + (-142.287766)*sailStates.q + (2.763718)*sailStates.r + (-0.068238)*sailStates.de;
	Cn = (0.221065)*sailStates.alpha + (0.017057)*sailStates.beta + (0.106782)*sailStates.p + (0.385841)*sailStates.q + (-0.033368)*sailStates.r + (0.000060)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end