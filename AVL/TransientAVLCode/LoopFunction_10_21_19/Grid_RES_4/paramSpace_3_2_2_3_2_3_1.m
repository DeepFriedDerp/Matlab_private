function [aeroForces] = paramSpace_3_2_2_3_2_3_1(sailStates,airStates)

	CL = (4.276345)*sailStates.alpha + (0.068947)*sailStates.beta + (-2.323562)*sailStates.p + (33.633221)*sailStates.q + (0.947697)*sailStates.r + (0.011090)*sailStates.de;
	CD = -0.184350;
	CY = (-0.031235)*sailStates.alpha + (-0.024955)*sailStates.beta + (0.365933)*sailStates.p + (0.065299)*sailStates.q + (-0.023987)*sailStates.r + (0.000014)*sailStates.de;

	Cl = (1.212139)*sailStates.alpha + (-0.165064)*sailStates.beta + (-1.017221)*sailStates.p + (8.221638)*sailStates.q + (0.800505)*sailStates.r + (0.000046)*sailStates.de;
	Cm = (-14.353714)*sailStates.alpha + (-0.255779)*sailStates.beta + (7.744490)*sailStates.p + (-130.047943)*sailStates.q + (-3.203718)*sailStates.r + (-0.069357)*sailStates.de;
	Cn = (0.230994)*sailStates.alpha + (0.012377)*sailStates.beta + (-0.774320)*sailStates.p + (3.341279)*sailStates.q + (0.002635)*sailStates.r + (0.000048)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end