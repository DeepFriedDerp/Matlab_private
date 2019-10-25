function [aeroForces] = paramSpace_6_1_4_1_1_2_2(sailStates,airStates)

	CL = (4.986040)*sailStates.alpha + (0.000000)*sailStates.beta + (-3.052871)*sailStates.p + (37.423279)*sailStates.q + (1.123711)*sailStates.r + (0.011032)*sailStates.de;
	CD = -0.904760;
	CY = (0.044302)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.683118)*sailStates.p + (-0.839977)*sailStates.q + (0.047680)*sailStates.r + (-0.000183)*sailStates.de;

	Cl = (1.841193)*sailStates.alpha + (-0.307615)*sailStates.beta + (-1.620506)*sailStates.p + (13.215453)*sailStates.q + (1.141662)*sailStates.r + (0.001048)*sailStates.de;
	Cm = (-15.450838)*sailStates.alpha + (-0.000000)*sailStates.beta + (10.885416)*sailStates.p + (-151.784744)*sailStates.q + (-3.831494)*sailStates.r + (-0.071706)*sailStates.de;
	Cn = (-0.139979)*sailStates.alpha + (-0.021511)*sailStates.beta + (-1.592531)*sailStates.p + (8.102051)*sailStates.q + (-0.023818)*sailStates.r + (0.000363)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end