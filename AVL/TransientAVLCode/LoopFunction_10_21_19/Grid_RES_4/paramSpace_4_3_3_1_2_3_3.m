function [aeroForces] = paramSpace_4_3_3_1_2_3_3(sailStates,airStates)

	CL = (6.179538)*sailStates.alpha + (-0.262858)*sailStates.beta + (-3.501856)*sailStates.p + (50.503510)*sailStates.q + (3.586412)*sailStates.r + (0.012633)*sailStates.de;
	CD = -2.442500;
	CY = (0.418795)*sailStates.alpha + (-0.024249)*sailStates.beta + (1.366272)*sailStates.p + (-0.662185)*sailStates.q + (-0.271792)*sailStates.r + (-0.000143)*sailStates.de;

	Cl = (2.056999)*sailStates.alpha + (-0.737460)*sailStates.beta + (-1.900420)*sailStates.p + (18.540689)*sailStates.q + (3.055561)*sailStates.r + (0.001434)*sailStates.de;
	Cm = (-9.954613)*sailStates.alpha + (0.990714)*sailStates.beta + (9.445404)*sailStates.p + (-158.727356)*sailStates.q + (-11.885704)*sailStates.r + (-0.070277)*sailStates.de;
	Cn = (-1.867989)*sailStates.alpha + (0.128576)*sailStates.beta + (-2.751260)*sailStates.p + (11.427746)*sailStates.q + (0.014636)*sailStates.r + (0.000460)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end