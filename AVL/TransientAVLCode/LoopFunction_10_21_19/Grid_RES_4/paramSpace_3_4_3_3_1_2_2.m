function [aeroForces] = paramSpace_3_4_3_3_1_2_2(sailStates,airStates)

	CL = (4.018814)*sailStates.alpha + (-0.097890)*sailStates.beta + (-2.541991)*sailStates.p + (34.738598)*sailStates.q + (0.465438)*sailStates.r + (0.010857)*sailStates.de;
	CD = 0.023270;
	CY = (-0.062142)*sailStates.alpha + (-0.024202)*sailStates.beta + (0.162999)*sailStates.p + (-0.498142)*sailStates.q + (-0.010701)*sailStates.r + (-0.000107)*sailStates.de;

	Cl = (1.188662)*sailStates.alpha + (-0.090347)*sailStates.beta + (-1.146816)*sailStates.p + (9.116916)*sailStates.q + (0.341915)*sailStates.r + (0.000198)*sailStates.de;
	Cm = (-14.459121)*sailStates.alpha + (0.380441)*sailStates.beta + (8.631155)*sailStates.p + (-135.916275)*sailStates.q + (-1.581204)*sailStates.r + (-0.068978)*sailStates.de;
	Cn = (0.054696)*sailStates.alpha + (0.003516)*sailStates.beta + (-0.280571)*sailStates.p + (1.394350)*sailStates.q + (0.000902)*sailStates.r + (0.000158)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end