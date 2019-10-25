function [aeroForces] = paramSpace_3_3_2_3_1_1_1(sailStates,airStates)

	CL = (4.146678)*sailStates.alpha + (0.026683)*sailStates.beta + (-2.284496)*sailStates.p + (32.098980)*sailStates.q + (-0.227177)*sailStates.r + (0.010776)*sailStates.de;
	CD = -0.115930;
	CY = (-0.035038)*sailStates.alpha + (-0.024837)*sailStates.beta + (-0.170188)*sailStates.p + (-0.432842)*sailStates.q + (0.011170)*sailStates.r + (-0.000093)*sailStates.de;

	Cl = (1.079722)*sailStates.alpha + (0.107875)*sailStates.beta + (-0.970680)*sailStates.p + (7.414128)*sailStates.q + (-0.316342)*sailStates.r + (-0.000052)*sailStates.de;
	Cm = (-14.874571)*sailStates.alpha + (-0.122585)*sailStates.beta + (7.977233)*sailStates.p + (-129.813766)*sailStates.q + (0.785342)*sailStates.r + (-0.069334)*sailStates.de;
	Cn = (-0.164099)*sailStates.alpha + (-0.006504)*sailStates.beta + (0.442806)*sailStates.p + (-1.804734)*sailStates.q + (-0.004183)*sailStates.r + (0.000092)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end