function [aeroForces] = paramSpace_1_1_2_2_2_1_1(sailStates,airStates)

	CL = (5.022091)*sailStates.alpha + (0.677593)*sailStates.beta + (-5.720261)*sailStates.p + (53.486111)*sailStates.q + (2.158913)*sailStates.r + (0.010837)*sailStates.de;
	CD = -6.573340;
	CY = (2.243801)*sailStates.alpha + (-0.032343)*sailStates.beta + (1.236143)*sailStates.p + (3.937212)*sailStates.q + (0.163020)*sailStates.r + (0.000889)*sailStates.de;

	Cl = (-0.793475)*sailStates.alpha + (-0.651903)*sailStates.beta + (-3.972408)*sailStates.p + (34.453663)*sailStates.q + (2.353051)*sailStates.r + (0.005205)*sailStates.de;
	Cm = (3.307737)*sailStates.alpha + (-2.832220)*sailStates.beta + (21.314016)*sailStates.p + (-229.198776)*sailStates.q + (-7.292881)*sailStates.r + (-0.080714)*sailStates.de;
	Cn = (-8.373306)*sailStates.alpha + (-0.112300)*sailStates.beta + (-3.408430)*sailStates.p + (14.678996)*sailStates.q + (-0.070780)*sailStates.r + (-0.000716)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end