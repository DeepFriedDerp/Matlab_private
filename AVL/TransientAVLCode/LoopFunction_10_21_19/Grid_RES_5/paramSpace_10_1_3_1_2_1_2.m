function [aeroForces] = paramSpace_10_1_3_1_2_1_2(sailStates,airStates)

	CL = (4.927230)*sailStates.alpha + (0.000000)*sailStates.beta + (-3.052243)*sailStates.p + (37.458988)*sailStates.q + (-1.104597)*sailStates.r + (0.010966)*sailStates.de;
	CD = -0.868440;
	CY = (-0.037900)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.652871)*sailStates.p + (0.839976)*sailStates.q + (0.045683)*sailStates.r + (0.000183)*sailStates.de;

	Cl = (1.828611)*sailStates.alpha + (0.292496)*sailStates.beta + (-1.620209)*sailStates.p + (13.217056)*sailStates.q + (-1.092752)*sailStates.r + (0.001048)*sailStates.de;
	Cm = (-15.291984)*sailStates.alpha + (-0.000000)*sailStates.beta + (10.877606)*sailStates.p + (-151.784744)*sailStates.q + (3.719814)*sailStates.r + (-0.071706)*sailStates.de;
	Cn = (0.118311)*sailStates.alpha + (-0.020453)*sailStates.beta + (1.547857)*sailStates.p + (-8.079124)*sailStates.q + (-0.023957)*sailStates.r + (-0.000390)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end