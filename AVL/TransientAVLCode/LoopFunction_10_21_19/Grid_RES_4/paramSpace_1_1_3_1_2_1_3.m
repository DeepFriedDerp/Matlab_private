function [aeroForces] = paramSpace_1_1_3_1_2_1_3(sailStates,airStates)

	CL = (6.130908)*sailStates.alpha + (-0.763263)*sailStates.beta + (-3.483979)*sailStates.p + (50.185810)*sailStates.q + (-3.568877)*sailStates.r + (0.012547)*sailStates.de;
	CD = -2.425860;
	CY = (-0.413236)*sailStates.alpha + (-0.026825)*sailStates.beta + (-1.349956)*sailStates.p + (0.662189)*sailStates.q + (-0.268499)*sailStates.r + (0.000141)*sailStates.de;

	Cl = (2.087162)*sailStates.alpha + (0.399788)*sailStates.beta + (-1.954964)*sailStates.p + (19.255545)*sailStates.q + (-3.038753)*sailStates.r + (0.001594)*sailStates.de;
	Cm = (-9.970937)*sailStates.alpha + (2.824483)*sailStates.beta + (9.394578)*sailStates.p + (-157.701111)*sailStates.q + (11.803329)*sailStates.r + (-0.069233)*sailStates.de;
	Cn = (1.976179)*sailStates.alpha + (0.133208)*sailStates.beta + (2.714313)*sailStates.p + (-11.254001)*sailStates.q + (0.012777)*sailStates.r + (-0.000472)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end