function [aeroForces] = paramSpace_14_1_3_1_2_2_1(sailStates,airStates)

	CL = (4.395318)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.114510)*sailStates.p + (35.897545)*sailStates.q + (1.901423)*sailStates.r + (0.011279)*sailStates.de;
	CD = -0.597230;
	CY = (0.049608)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.620316)*sailStates.p + (1.364606)*sailStates.q + (-0.131803)*sailStates.r + (0.000286)*sailStates.de;

	Cl = (0.887023)*sailStates.alpha + (-0.364219)*sailStates.beta + (-0.807371)*sailStates.p + (7.281097)*sailStates.q + (1.565497)*sailStates.r + (-0.000242)*sailStates.de;
	Cm = (-10.912371)*sailStates.alpha + (0.000000)*sailStates.beta + (5.959656)*sailStates.p + (-122.335159)*sailStates.q + (-6.322107)*sailStates.r + (-0.066282)*sailStates.de;
	Cn = (0.490382)*sailStates.alpha + (0.077417)*sailStates.beta + (-1.322906)*sailStates.p + (4.496036)*sailStates.q + (-0.015207)*sailStates.r + (-0.000292)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end