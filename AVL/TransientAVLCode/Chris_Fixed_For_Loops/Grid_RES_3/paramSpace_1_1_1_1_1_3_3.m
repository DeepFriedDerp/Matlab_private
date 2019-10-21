function [aeroForces] = paramSpace_1_1_1_1_1_3_3(sailStates,airStates)

	CL = (2.849251)*sailStates.alpha + (-0.052656)*sailStates.beta + (-4.013815)*sailStates.p + (46.155075)*sailStates.q + (-0.663859)*sailStates.r + (0.011052)*sailStates.de;
	CD = -0.019350;
	CY = (0.064123)*sailStates.alpha + (-0.025733)*sailStates.beta + (-0.006546)*sailStates.p + (0.559191)*sailStates.q + (-0.001207)*sailStates.r + (0.000122)*sailStates.de;

	Cl = (1.075140)*sailStates.alpha + (-0.046734)*sailStates.beta + (-2.456415)*sailStates.p + (21.688541)*sailStates.q + (-0.379959)*sailStates.r + (0.002530)*sailStates.de;
	Cm = (-10.593704)*sailStates.alpha + (0.204358)*sailStates.beta + (13.858575)*sailStates.p + (-179.092468)*sailStates.q + (2.303250)*sailStates.r + (-0.073223)*sailStates.de;
	Cn = (0.076552)*sailStates.alpha + (-0.007582)*sailStates.beta + (-0.422016)*sailStates.p + (3.350166)*sailStates.q + (-0.065163)*sailStates.r + (-0.000104)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end