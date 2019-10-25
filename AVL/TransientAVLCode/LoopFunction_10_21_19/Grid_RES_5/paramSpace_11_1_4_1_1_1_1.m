function [aeroForces] = paramSpace_11_1_4_1_1_1_1(sailStates,airStates)

	CL = (4.270718)*sailStates.alpha + (-0.000000)*sailStates.beta + (-1.976080)*sailStates.p + (28.592646)*sailStates.q + (-0.594137)*sailStates.r + (0.010185)*sailStates.de;
	CD = -0.476860;
	CY = (-0.020549)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.336964)*sailStates.p + (-0.768920)*sailStates.q + (0.035335)*sailStates.r + (-0.000164)*sailStates.de;

	Cl = (0.898179)*sailStates.alpha + (0.199452)*sailStates.beta + (-0.759249)*sailStates.p + (5.329640)*sailStates.q + (-0.679790)*sailStates.r + (-0.000355)*sailStates.de;
	Cm = (-14.674953)*sailStates.alpha + (0.000000)*sailStates.beta + (7.238270)*sailStates.p + (-122.164581)*sailStates.q + (1.976333)*sailStates.r + (-0.068317)*sailStates.de;
	Cn = (-0.477655)*sailStates.alpha + (-0.020963)*sailStates.beta + (0.862957)*sailStates.p + (-3.631973)*sailStates.q + (-0.010953)*sailStates.r + (0.000138)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end