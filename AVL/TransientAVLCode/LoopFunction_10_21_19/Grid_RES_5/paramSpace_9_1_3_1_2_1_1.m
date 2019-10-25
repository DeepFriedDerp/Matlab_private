function [aeroForces] = paramSpace_9_1_3_1_2_1_1(sailStates,airStates)

	CL = (5.052957)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.052306)*sailStates.p + (30.001690)*sailStates.q + (-1.389460)*sailStates.r + (0.010692)*sailStates.de;
	CD = -0.916570;
	CY = (0.281635)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.728058)*sailStates.p + (1.046668)*sailStates.q + (0.025461)*sailStates.r + (0.000224)*sailStates.de;

	Cl = (1.429669)*sailStates.alpha + (0.321660)*sailStates.beta + (-0.792798)*sailStates.p + (5.693276)*sailStates.q + (-1.302748)*sailStates.r + (-0.000312)*sailStates.de;
	Cm = (-15.420333)*sailStates.alpha + (0.000000)*sailStates.beta + (7.314968)*sailStates.p + (-123.745377)*sailStates.q + (4.699765)*sailStates.r + (-0.069078)*sailStates.de;
	Cn = (-1.044405)*sailStates.alpha + (-0.011233)*sailStates.beta + (1.627508)*sailStates.p + (-8.269496)*sailStates.q + (-0.010439)*sailStates.r + (-0.000429)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end