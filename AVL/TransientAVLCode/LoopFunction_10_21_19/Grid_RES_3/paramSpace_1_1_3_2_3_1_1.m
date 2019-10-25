function [aeroForces] = paramSpace_1_1_3_2_3_1_1(sailStates,airStates)

	CL = (4.759587)*sailStates.alpha + (-0.355203)*sailStates.beta + (-2.144622)*sailStates.p + (34.972290)*sailStates.q + (-1.939781)*sailStates.r + (0.011152)*sailStates.de;
	CD = -0.619910;
	CY = (0.191774)*sailStates.alpha + (-0.025948)*sailStates.beta + (-0.726823)*sailStates.p + (0.491413)*sailStates.q + (-0.128112)*sailStates.r + (0.000103)*sailStates.de;

	Cl = (1.461611)*sailStates.alpha + (0.231407)*sailStates.beta + (-0.898314)*sailStates.p + (8.171242)*sailStates.q + (-1.570811)*sailStates.r + (-0.000110)*sailStates.de;
	Cm = (-12.775113)*sailStates.alpha + (1.262495)*sailStates.beta + (6.171363)*sailStates.p + (-122.751343)*sailStates.q + (6.433529)*sailStates.r + (-0.066320)*sailStates.de;
	Cn = (-0.634742)*sailStates.alpha + (0.064180)*sailStates.beta + (1.524841)*sailStates.p + (-6.949305)*sailStates.q + (0.019569)*sailStates.r + (-0.000261)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end