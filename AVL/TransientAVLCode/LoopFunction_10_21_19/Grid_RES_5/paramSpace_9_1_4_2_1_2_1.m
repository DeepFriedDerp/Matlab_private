function [aeroForces] = paramSpace_9_1_4_2_1_2_1(sailStates,airStates)

	CL = (4.284490)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.367329)*sailStates.p + (33.610096)*sailStates.q + (0.819423)*sailStates.r + (0.011042)*sailStates.de;
	CD = -0.154300;
	CY = (-0.081687)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.378725)*sailStates.p + (-0.381223)*sailStates.q + (-0.013266)*sailStates.r + (-0.000082)*sailStates.de;

	Cl = (1.258257)*sailStates.alpha + (-0.173931)*sailStates.beta + (-1.038835)*sailStates.p + (8.258129)*sailStates.q + (0.735439)*sailStates.r + (0.000058)*sailStates.de;
	Cm = (-14.679203)*sailStates.alpha + (-0.000000)*sailStates.beta + (8.007762)*sailStates.p + (-131.546402)*sailStates.q + (-2.809095)*sailStates.r + (-0.069816)*sailStates.de;
	Cn = (0.274754)*sailStates.alpha + (0.006074)*sailStates.beta + (-0.789868)*sailStates.p + (3.645544)*sailStates.q + (0.002931)*sailStates.r + (0.000157)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end