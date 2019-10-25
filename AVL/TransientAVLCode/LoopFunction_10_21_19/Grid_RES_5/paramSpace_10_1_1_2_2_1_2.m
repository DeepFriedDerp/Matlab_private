function [aeroForces] = paramSpace_10_1_1_2_2_1_2(sailStates,airStates)

	CL = (4.210248)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.771374)*sailStates.p + (36.006306)*sailStates.q + (-0.271553)*sailStates.r + (0.011072)*sailStates.de;
	CD = -0.125990;
	CY = (0.020815)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.252353)*sailStates.p + (0.351850)*sailStates.q + (0.017609)*sailStates.r + (0.000076)*sailStates.de;

	Cl = (1.401408)*sailStates.alpha + (0.111958)*sailStates.beta + (-1.381367)*sailStates.p + (11.230906)*sailStates.q + (-0.357350)*sailStates.r + (0.000638)*sailStates.de;
	Cm = (-15.061177)*sailStates.alpha + (-0.000000)*sailStates.beta + (9.651312)*sailStates.p + (-143.366257)*sailStates.q + (0.948286)*sailStates.r + (-0.070788)*sailStates.de;
	Cn = (-0.119176)*sailStates.alpha + (-0.007829)*sailStates.beta + (0.623320)*sailStates.p + (-3.260499)*sailStates.q + (-0.012098)*sailStates.r + (-0.000134)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end