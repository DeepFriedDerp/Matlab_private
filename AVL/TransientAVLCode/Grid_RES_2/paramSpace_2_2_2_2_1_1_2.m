function [aeroForces] = paramSpace_2_2_2_2_1_1_2(sailStates,airStates)

	CL = (5.160551)*sailStates.alpha + (-3.948684)*sailStates.beta + (-3.433314)*sailStates.p + (47.230453)*sailStates.q + (2.205662)*sailStates.r + (0.010354)*sailStates.de;
	CD = -5.827870;
	CY = (1.757235)*sailStates.alpha + (-0.268495)*sailStates.beta + (0.338066)*sailStates.p + (15.239991)*sailStates.q + (-0.033713)*sailStates.r + (0.002900)*sailStates.de;

	Cl = (-5.376214)*sailStates.alpha + (-1.241819)*sailStates.beta + (-1.662311)*sailStates.p + (14.119581)*sailStates.q + (2.457089)*sailStates.r + (0.001206)*sailStates.de;
	Cm = (5.557433)*sailStates.alpha + (18.078949)*sailStates.beta + (10.668897)*sailStates.p + (-150.970367)*sailStates.q + (-7.858188)*sailStates.r + (-0.055233)*sailStates.de;
	Cn = (-1.811062)*sailStates.alpha + (0.382096)*sailStates.beta + (-0.945462)*sailStates.p + (-8.508699)*sailStates.q + (-0.199260)*sailStates.r + (-0.003820)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end