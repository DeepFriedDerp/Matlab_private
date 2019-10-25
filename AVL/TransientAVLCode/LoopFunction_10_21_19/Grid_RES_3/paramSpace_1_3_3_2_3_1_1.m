function [aeroForces] = paramSpace_1_3_3_2_3_1_1(sailStates,airStates)

	CL = (4.759587)*sailStates.alpha + (0.355203)*sailStates.beta + (-2.144622)*sailStates.p + (34.972290)*sailStates.q + (-1.939781)*sailStates.r + (0.011152)*sailStates.de;
	CD = -0.619910;
	CY = (0.191774)*sailStates.alpha + (-0.023714)*sailStates.beta + (-0.726823)*sailStates.p + (0.491413)*sailStates.q + (-0.128112)*sailStates.r + (0.000103)*sailStates.de;

	Cl = (1.330294)*sailStates.alpha + (0.449144)*sailStates.beta + (-0.813662)*sailStates.p + (7.110374)*sailStates.q + (-1.555985)*sailStates.r + (-0.000336)*sailStates.de;
	Cm = (-12.775113)*sailStates.alpha + (-1.262496)*sailStates.beta + (6.171363)*sailStates.p + (-122.751358)*sailStates.q + (6.433528)*sailStates.r + (-0.066320)*sailStates.de;
	Cn = (-0.740206)*sailStates.alpha + (0.055819)*sailStates.beta + (1.539768)*sailStates.p + (-7.136364)*sailStates.q + (0.022183)*sailStates.r + (-0.000261)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end