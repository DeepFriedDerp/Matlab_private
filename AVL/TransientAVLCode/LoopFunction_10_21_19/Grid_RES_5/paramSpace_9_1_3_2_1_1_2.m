function [aeroForces] = paramSpace_9_1_3_2_1_1_2(sailStates,airStates)

	CL = (4.127915)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.781977)*sailStates.p + (36.379639)*sailStates.q + (-0.231154)*sailStates.r + (0.011126)*sailStates.de;
	CD = -0.065290;
	CY = (-0.066510)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.135089)*sailStates.p + (-0.438541)*sailStates.q + (0.004702)*sailStates.r + (-0.000095)*sailStates.de;

	Cl = (1.338714)*sailStates.alpha + (0.085297)*sailStates.beta + (-1.384871)*sailStates.p + (11.320375)*sailStates.q + (-0.267962)*sailStates.r + (0.000625)*sailStates.de;
	Cm = (-14.764521)*sailStates.alpha + (-0.000000)*sailStates.beta + (9.574576)*sailStates.p + (-143.320496)*sailStates.q + (0.782204)*sailStates.r + (-0.071014)*sailStates.de;
	Cn = (0.005407)*sailStates.alpha + (-0.002979)*sailStates.beta + (0.365117)*sailStates.p + (-1.535224)*sailStates.q + (-0.001704)*sailStates.r + (0.000087)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end