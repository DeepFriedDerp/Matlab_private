function [aeroForces] = paramSpace_2_4_2_3_2_1_1(sailStates,airStates)

	CL = (4.209215)*sailStates.alpha + (0.227274)*sailStates.beta + (-2.303807)*sailStates.p + (33.383526)*sailStates.q + (-0.953488)*sailStates.r + (0.010892)*sailStates.de;
	CD = -0.188530;
	CY = (0.032839)*sailStates.alpha + (-0.024863)*sailStates.beta + (-0.380203)*sailStates.p + (-0.065301)*sailStates.q + (-0.024918)*sailStates.r + (-0.000014)*sailStates.de;

	Cl = (1.089387)*sailStates.alpha + (0.251303)*sailStates.beta + (-0.942743)*sailStates.p + (7.341694)*sailStates.q + (-0.818122)*sailStates.r + (-0.000129)*sailStates.de;
	Cm = (-14.064608)*sailStates.alpha + (-0.899543)*sailStates.beta + (7.674711)*sailStates.p + (-129.003830)*sailStates.q + (3.242951)*sailStates.r + (-0.068300)*sailStates.de;
	Cn = (-0.274347)*sailStates.alpha + (0.011766)*sailStates.beta + (0.799748)*sailStates.p + (-3.403952)*sailStates.q + (0.002804)*sailStates.r + (-0.000039)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end