function [aeroForces] = paramSpace_1_3_1_1_2_3_1(sailStates,airStates)

	CL = (5.349017)*sailStates.alpha + (-0.111972)*sailStates.beta + (-1.457325)*sailStates.p + (20.157169)*sailStates.q + (1.598268)*sailStates.r + (0.008572)*sailStates.de;
	CD = -2.002420;
	CY = (-0.407876)*sailStates.alpha + (-0.025749)*sailStates.beta + (0.894199)*sailStates.p + (-0.662190)*sailStates.q + (0.177938)*sailStates.r + (-0.000138)*sailStates.de;

	Cl = (0.977869)*sailStates.alpha + (-0.459453)*sailStates.beta + (-0.393603)*sailStates.p + (0.880449)*sailStates.q + (1.660983)*sailStates.r + (-0.000819)*sailStates.de;
	Cm = (-16.086355)*sailStates.alpha + (0.407674)*sailStates.beta + (6.879846)*sailStates.p + (-110.966957)*sailStates.q + (-5.168255)*sailStates.r + (-0.065509)*sailStates.de;
	Cn = (1.976965)*sailStates.alpha + (-0.079580)*sailStates.beta + (-2.084789)*sailStates.p + (9.964490)*sailStates.q + (-0.068993)*sailStates.r + (0.000346)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end