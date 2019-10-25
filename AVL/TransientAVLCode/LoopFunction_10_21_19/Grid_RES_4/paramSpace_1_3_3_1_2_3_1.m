function [aeroForces] = paramSpace_1_3_3_1_2_3_1(sailStates,airStates)

	CL = (5.485594)*sailStates.alpha + (-0.124940)*sailStates.beta + (-1.458158)*sailStates.p + (20.061426)*sailStates.q + (1.612067)*sailStates.r + (0.008743)*sailStates.de;
	CD = -2.087060;
	CY = (-0.418715)*sailStates.alpha + (-0.025657)*sailStates.beta + (0.922687)*sailStates.p + (-0.662189)*sailStates.q + (0.183510)*sailStates.r + (-0.000138)*sailStates.de;

	Cl = (0.978640)*sailStates.alpha + (-0.473308)*sailStates.beta + (-0.394127)*sailStates.p + (0.875919)*sailStates.q + (1.706388)*sailStates.r + (-0.000819)*sailStates.de;
	Cm = (-16.489038)*sailStates.alpha + (0.494771)*sailStates.beta + (6.895930)*sailStates.p + (-110.966957)*sailStates.q + (-5.249115)*sailStates.r + (-0.065509)*sailStates.de;
	Cn = (2.008931)*sailStates.alpha + (-0.082554)*sailStates.beta + (-2.127712)*sailStates.p + (9.987262)*sailStates.q + (-0.068244)*sailStates.r + (0.000338)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end