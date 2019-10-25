function [aeroForces] = paramSpace_4_2_1_2_3_1_1(sailStates,airStates)

	CL = (4.346786)*sailStates.alpha + (-0.036960)*sailStates.beta + (-2.038741)*sailStates.p + (28.180090)*sailStates.q + (-0.397744)*sailStates.r + (0.009876)*sailStates.de;
	CD = -0.466820;
	CY = (0.195379)*sailStates.alpha + (-0.023962)*sailStates.beta + (-0.436595)*sailStates.p + (1.057312)*sailStates.q + (0.086731)*sailStates.r + (0.000223)*sailStates.de;

	Cl = (1.203430)*sailStates.alpha + (0.166126)*sailStates.beta + (-0.850780)*sailStates.p + (6.048649)*sailStates.q + (-0.589367)*sailStates.r + (-0.000084)*sailStates.de;
	Cm = (-15.757311)*sailStates.alpha + (0.175353)*sailStates.beta + (7.861600)*sailStates.p + (-125.069839)*sailStates.q + (1.259565)*sailStates.r + (-0.066745)*sailStates.de;
	Cn = (-0.719076)*sailStates.alpha + (-0.038387)*sailStates.beta + (1.083637)*sailStates.p + (-5.956558)*sailStates.q + (-0.064818)*sailStates.r + (-0.000371)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end