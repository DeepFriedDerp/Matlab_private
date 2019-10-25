function [aeroForces] = paramSpace_1_2_2_1_2_1_1(sailStates,airStates)

	CL = (6.269537)*sailStates.alpha + (0.000000)*sailStates.beta + (-1.794847)*sailStates.p + (35.060696)*sailStates.q + (-2.819696)*sailStates.r + (0.011749)*sailStates.de;
	CD = -2.346670;
	CY = (0.344660)*sailStates.alpha + (-0.025000)*sailStates.beta + (-1.140525)*sailStates.p + (-0.589409)*sailStates.q + (-0.201105)*sailStates.r + (-0.000124)*sailStates.de;

	Cl = (1.316476)*sailStates.alpha + (0.593774)*sailStates.beta + (-0.517785)*sailStates.p + (5.022284)*sailStates.q + (-2.440470)*sailStates.r + (-0.000783)*sailStates.de;
	Cm = (-9.862330)*sailStates.alpha + (-0.000000)*sailStates.beta + (4.206413)*sailStates.p + (-111.551048)*sailStates.q + (9.379253)*sailStates.r + (-0.066175)*sailStates.de;
	Cn = (-2.008469)*sailStates.alpha + (0.104698)*sailStates.beta + (2.553046)*sailStates.p + (-11.025696)*sailStates.q + (0.035949)*sailStates.r + (-0.000002)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end