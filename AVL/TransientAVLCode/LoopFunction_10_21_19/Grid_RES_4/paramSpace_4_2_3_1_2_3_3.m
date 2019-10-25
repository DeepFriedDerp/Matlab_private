function [aeroForces] = paramSpace_4_2_3_1_2_3_3(sailStates,airStates)

	CL = (6.179538)*sailStates.alpha + (0.262858)*sailStates.beta + (-3.501857)*sailStates.p + (50.503502)*sailStates.q + (3.586412)*sailStates.r + (0.012633)*sailStates.de;
	CD = -2.442500;
	CY = (0.418795)*sailStates.alpha + (-0.025703)*sailStates.beta + (1.366272)*sailStates.p + (-0.662185)*sailStates.q + (-0.271792)*sailStates.r + (-0.000143)*sailStates.de;

	Cl = (2.082614)*sailStates.alpha + (-0.574518)*sailStates.beta + (-1.931957)*sailStates.p + (18.937666)*sailStates.q + (3.061848)*sailStates.r + (0.001522)*sailStates.de;
	Cm = (-9.954618)*sailStates.alpha + (-0.990714)*sailStates.beta + (9.445402)*sailStates.p + (-158.727341)*sailStates.q + (-11.885704)*sailStates.r + (-0.070277)*sailStates.de;
	Cn = (-1.932653)*sailStates.alpha + (0.132393)*sailStates.beta + (-2.744987)*sailStates.p + (11.348783)*sailStates.q + (0.013386)*sailStates.r + (0.000460)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end