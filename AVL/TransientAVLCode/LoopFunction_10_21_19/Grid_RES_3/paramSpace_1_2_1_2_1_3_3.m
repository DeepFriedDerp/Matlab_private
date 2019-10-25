function [aeroForces] = paramSpace_1_2_1_2_1_3_3(sailStates,airStates)

	CL = (4.215649)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.843666)*sailStates.p + (35.275394)*sailStates.q + (0.183135)*sailStates.r + (0.010203)*sailStates.de;
	CD = -0.377880;
	CY = (-0.000385)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.331080)*sailStates.p + (-0.491415)*sailStates.q + (0.058425)*sailStates.r + (-0.000105)*sailStates.de;

	Cl = (1.502932)*sailStates.alpha + (-0.145942)*sailStates.beta + (-1.485341)*sailStates.p + (12.068476)*sailStates.q + (0.357379)*sailStates.r + (0.000903)*sailStates.de;
	Cm = (-14.823387)*sailStates.alpha + (0.000000)*sailStates.beta + (10.403072)*sailStates.p + (-147.390610)*sailStates.q + (-0.512403)*sailStates.r + (-0.069614)*sailStates.de;
	Cn = (0.180105)*sailStates.alpha + (-0.025733)*sailStates.beta + (-0.985793)*sailStates.p + (5.828923)*sailStates.q + (-0.064874)*sailStates.r + (0.000243)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end