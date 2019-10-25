function [aeroForces] = paramSpace_2_2_1_2_3_3_1(sailStates,airStates)

	CL = (4.215057)*sailStates.alpha + (0.037817)*sailStates.beta + (-2.130079)*sailStates.p + (30.569893)*sailStates.q + (0.515365)*sailStates.r + (0.010566)*sailStates.de;
	CD = -0.286510;
	CY = (0.036670)*sailStates.alpha + (-0.025285)*sailStates.beta + (0.270867)*sailStates.p + (0.668510)*sailStates.q + (0.017683)*sailStates.r + (0.000143)*sailStates.de;

	Cl = (1.032838)*sailStates.alpha + (-0.150383)*sailStates.beta + (-0.882492)*sailStates.p + (6.635414)*sailStates.q + (0.557930)*sailStates.r + (-0.000156)*sailStates.de;
	Cm = (-14.669620)*sailStates.alpha + (-0.132219)*sailStates.beta + (7.545240)*sailStates.p + (-125.787453)*sailStates.q + (-1.726280)*sailStates.r + (-0.068952)*sailStates.de;
	Cn = (0.307946)*sailStates.alpha + (-0.010833)*sailStates.beta + (-0.693540)*sailStates.p + (2.927367)*sailStates.q + (-0.005218)*sailStates.r + (-0.000122)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end