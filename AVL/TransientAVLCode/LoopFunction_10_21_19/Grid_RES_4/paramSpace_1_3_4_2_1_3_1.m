function [aeroForces] = paramSpace_1_3_4_2_1_3_1(sailStates,airStates)

	CL = (4.346786)*sailStates.alpha + (-0.036960)*sailStates.beta + (-2.038740)*sailStates.p + (28.180090)*sailStates.q + (0.397743)*sailStates.r + (0.009876)*sailStates.de;
	CD = -0.466820;
	CY = (-0.195379)*sailStates.alpha + (-0.025991)*sailStates.beta + (0.436595)*sailStates.p + (-1.057312)*sailStates.q + (0.086731)*sailStates.r + (-0.000223)*sailStates.de;

	Cl = (1.146841)*sailStates.alpha + (-0.186486)*sailStates.beta + (-0.819232)*sailStates.p + (5.651680)*sailStates.q + (0.595600)*sailStates.r + (-0.000169)*sailStates.de;
	Cm = (-15.757311)*sailStates.alpha + (0.175353)*sailStates.beta + (7.861600)*sailStates.p + (-125.069839)*sailStates.q + (-1.259565)*sailStates.r + (-0.066745)*sailStates.de;
	Cn = (0.723807)*sailStates.alpha + (-0.031752)*sailStates.beta + (-1.077361)*sailStates.p + (5.877595)*sailStates.q + (-0.063579)*sailStates.r + (0.000371)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end