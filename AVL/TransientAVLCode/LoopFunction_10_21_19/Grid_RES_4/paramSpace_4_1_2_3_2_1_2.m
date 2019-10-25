function [aeroForces] = paramSpace_4_1_2_3_2_1_2(sailStates,airStates)

	CL = (3.916239)*sailStates.alpha + (0.040558)*sailStates.beta + (-2.411706)*sailStates.p + (32.660179)*sailStates.q + (0.313379)*sailStates.r + (0.010059)*sailStates.de;
	CD = -0.078340;
	CY = (0.000000)*sailStates.alpha + (-0.024786)*sailStates.beta + (-0.090235)*sailStates.p + (-0.000000)*sailStates.q + (0.017949)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.264908)*sailStates.alpha + (0.066396)*sailStates.beta + (-1.185811)*sailStates.p + (9.809275)*sailStates.q + (0.056601)*sailStates.r + (0.000455)*sailStates.de;
	Cm = (-14.468167)*sailStates.alpha + (-0.082726)*sailStates.beta + (8.546556)*sailStates.p + (-133.820877)*sailStates.q + (-1.090695)*sailStates.r + (-0.066661)*sailStates.de;
	Cn = (-0.242287)*sailStates.alpha + (-0.015256)*sailStates.beta + (0.403631)*sailStates.p + (-2.539699)*sailStates.q + (-0.044673)*sailStates.r + (-0.000028)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end