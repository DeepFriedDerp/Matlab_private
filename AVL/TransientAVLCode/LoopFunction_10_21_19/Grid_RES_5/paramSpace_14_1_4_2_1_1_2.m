function [aeroForces] = paramSpace_14_1_4_2_1_1_2(sailStates,airStates)

	CL = (3.779798)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.616913)*sailStates.p + (35.230507)*sailStates.q + (0.709159)*sailStates.r + (0.010148)*sailStates.de;
	CD = 0.055480;
	CY = (-0.061760)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.099449)*sailStates.p + (-0.571906)*sailStates.q + (-0.021200)*sailStates.r + (-0.000121)*sailStates.de;

	Cl = (1.271329)*sailStates.alpha + (-0.027072)*sailStates.beta + (-1.303524)*sailStates.p + (11.052256)*sailStates.q + (0.408556)*sailStates.r + (0.000575)*sailStates.de;
	Cm = (-13.867065)*sailStates.alpha + (-0.000000)*sailStates.beta + (8.964788)*sailStates.p + (-139.762878)*sailStates.q + (-2.439497)*sailStates.r + (-0.067975)*sailStates.de;
	Cn = (-0.172389)*sailStates.alpha + (0.005754)*sailStates.beta + (0.048876)*sailStates.p + (-0.836796)*sailStates.q + (-0.038494)*sailStates.r + (0.000139)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end